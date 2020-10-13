class SearchFlightsRequest {
  String flyFrom;
  String flyTo;
  String flyfromCity;
  String flyToCity;
  String dateFrom;
  String monthFrom;
  String monthTo;
  String dateTo;
  int adults;
  String maxStopovers;
  String vehicleType;
  String sort;
  String flightType;
  String selectedCabins;
  String cabinSelection_name;
  String cabinImageUri;
  String locale;
  int children;
  int infants;
  String curr;
  bool oneway;
  String returnFrom;
  String returnTo;

  SearchFlightsRequest(
      {this.flyFrom,
        this.flyTo,
        this.flyfromCity,
        this.flyToCity,
        this.monthFrom,
        this.monthTo,
        this.dateFrom,
        this.dateTo,
        this.adults,
        this.maxStopovers,
        this.vehicleType,
        this.sort,
        this.flightType,
        this.selectedCabins,
        this.cabinSelection_name,
        this.cabinImageUri,
        this.locale,
        this.children,
        this.infants,
        this.curr,
        this.oneway,
        this.returnFrom,
        this.returnTo
      });



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fly_from'] = this.flyFrom;
    data['fly_to'] = this.flyTo;
    data['fly_from_city'] = this.flyfromCity;
    data['fly_to_city'] = this.flyToCity;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['month_from'] = this.monthFrom;
    data['month_to'] = this.monthTo;
    data['adults'] = this.adults;
    data['max_stopovers'] = this.maxStopovers;
    data['vehicle_type'] = this.vehicleType;
    data['sort'] = this.sort;
    data['flight_type'] = this.flightType;
    data['selected_cabins'] = this.selectedCabins;
    data['cabin_selection_name'] = this.cabinSelection_name;
    data['cabin_selection_uri'] = this.cabinImageUri;
    data['locale'] = this.locale;
    data['children'] = this.children;
    data['infants'] = this.infants;
    data['curr'] = this.curr;
    data['oneway'] = this.oneway;
    data['return_from'] = this.returnFrom;
    data['return_to'] = this.returnTo;

    return data;
  }
}