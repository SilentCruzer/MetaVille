enum OrderStatus { PICKING_UP, DELIVERING }

class Order {
  final int id;
  final OrderStatus status;
  final String arrivalDate;
  final String placedDate;
  final String deliveryAddress;

  Order({
    this.id,
    this.status,
    this.arrivalDate,
    this.placedDate,
    this.deliveryAddress,
  });
}
