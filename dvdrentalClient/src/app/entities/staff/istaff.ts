export interface IStaff {
  active: boolean;
  email?: string;
  firstName: string;
  lastName: string;
  password?: string;
  staffId: number;
  storeId: number;
  username: string;

  addressDescriptiveField?: number;
  addressId: number;
}
