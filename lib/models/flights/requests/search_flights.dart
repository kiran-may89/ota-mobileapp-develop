class SearchFlights {
  String flyFrom;
  String flyTo;
  String dateFrom;
  String dateTo;
  String adults;
  String maxStopovers;
  String vehicleType;
  String sort;
  String flightType;
  String selectedCabins;
  String partnerMarket;
  String locale;
  String children;
  String infants;
  String curr;

  SearchFlights(
      {this.flyFrom,
        this.flyTo,
        this.dateFrom,
        this.dateTo,
        this.adults,
        this.maxStopovers,
        this.vehicleType,
        this.sort,
        this.flightType,
        this.selectedCabins,
        this.partnerMarket,
        this.locale,
        this.children,
        this.infants,
        this.curr});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fly_from'] = this.flyFrom;
    data['fly_to'] = this.flyTo;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['adults'] = this.adults;
    data['max_stopovers'] = this.maxStopovers;
    data['vehicle_type'] = this.vehicleType;
    data['sort'] = this.sort;
    data['flight_type'] = this.flightType;
    data['selected_cabins'] = this.selectedCabins;
    data['partner_market'] = this.partnerMarket;
    data['locale'] = this.locale;
    data['children'] = this.children;
    data['infants'] = this.infants;
    data['curr'] = this.curr;
    return data;
  }
}