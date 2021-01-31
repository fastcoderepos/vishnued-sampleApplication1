export interface IPayment {
  amount: number;
  paymentId: number;

  customerDescriptiveField?: number;
  customerId: number;
  rentalDescriptiveField?: number;
  rentalId: number;
  staffDescriptiveField?: number;
  staffId: number;
}
