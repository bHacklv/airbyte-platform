// TODO: This needs to be converted to interface, but has int he current state a problem with index signatures

// eslint-disable-next-line @typescript-eslint/consistent-type-definitions
export type ConnectorFormValues<T = unknown> = {
  name: string;
  connectionConfiguration: T;
  resourceAllocation?: {
    cpu: string;
    memory: string;
  };
};

// The whole ConnectorCard form values
export type ConnectorCardValues = { serviceType: string } & ConnectorFormValues;
