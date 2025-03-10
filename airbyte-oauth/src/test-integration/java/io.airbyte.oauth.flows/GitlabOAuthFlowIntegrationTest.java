/*
 * Copyright (c) 2020-2025 Airbyte, Inc., all rights reserved.
 */

package io.airbyte.oauth.flows;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.common.collect.ImmutableMap;
import io.airbyte.commons.json.Jsons;
import io.airbyte.config.SourceOAuthParameter;
import io.airbyte.data.services.OAuthService;
import io.airbyte.oauth.OAuthFlowImplementation;
import io.airbyte.validation.json.JsonValidationException;
import java.io.IOException;
import java.net.http.HttpClient;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

@Tag("oauth")
public class GitlabOAuthFlowIntegrationTest extends OAuthFlowIntegrationTest {

  protected static final Path CREDENTIALS_PATH = Path.of("secrets/gitlab.json");
  protected static final String REDIRECT_URL = "http://localhost:8000/auth_flow";
  protected static final int SERVER_LISTENING_PORT = 8000;

  @Override
  protected Path getCredentialsPath() {
    return CREDENTIALS_PATH;
  }

  @Override
  protected OAuthFlowImplementation getFlowImplementation(final OAuthService oauthService, HttpClient httpClient) {
    return new GitlabOAuthFlow(httpClient);
  }

  @Override
  protected int getServerListeningPort() {
    return SERVER_LISTENING_PORT;
  }

  @BeforeEach
  public void setup() throws IOException {
    super.setup();
  }

  @Test
  public void testFullGitlabOAuthFlow() throws InterruptedException, IOException, JsonValidationException {
    int limit = 20;
    final UUID workspaceId = UUID.randomUUID();
    final UUID definitionId = UUID.randomUUID();
    final String fullConfigAsString = Files.readString(CREDENTIALS_PATH);
    final JsonNode credentialsJson = Jsons.deserialize(fullConfigAsString);
    SourceOAuthParameter sourceOAuthParameter = new SourceOAuthParameter()
        .withOauthParameterId(UUID.randomUUID())
        .withSourceDefinitionId(definitionId)
        .withWorkspaceId(workspaceId)
        .withConfiguration(Jsons.jsonNode(ImmutableMap.builder()
            .put("client_id", credentialsJson.get("client_id").asText())
            .put("client_secret", credentialsJson.get("client_secret").asText())
            .build()));
    when(oauthService.getSourceOAuthParameterOptional(any(), any())).thenReturn(Optional.of(sourceOAuthParameter));
    final String url = flow.getSourceConsentUrl(
        workspaceId, definitionId, REDIRECT_URL, Jsons.emptyObject(), null, sourceOAuthParameter.getConfiguration());
    LOGGER.info("Waiting for user consent at: {}", url);
    // TODO: To automate, start a selenium job to navigate to the Consent URL and click on allowing
    // access...
    while (!serverHandler.isSucceeded() && limit > 0) {
      Thread.sleep(1000);
      limit -= 1;
    }
    assertTrue(serverHandler.isSucceeded(), "Failed to get User consent on time");
    final Map<String, Object> params = flow.completeSourceOAuth(workspaceId, definitionId,
        Map.of("code", serverHandler.getParamValue()), REDIRECT_URL, sourceOAuthParameter.getConfiguration());
    LOGGER.info("Response from completing OAuth Flow is: {}", params.toString());
    assertTrue(params.containsKey("access_token"));
    assertTrue(params.get("access_token").toString().length() > 0);
  }

}
