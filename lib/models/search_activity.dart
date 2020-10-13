class ActivitySearch {
  List<Filters> filters;
  String from;
  String to;
  String language;
  List<Paxes> paxes;
  Pagination pagination;
  String order;

  ActivitySearch(
      {this.filters,
        this.from,
        this.to,
        this.language,
        this.paxes,
        this.pagination,
        this.order});

  ActivitySearch.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = new List<Filters>();
      json['filters'].forEach((v) {
        filters.add(new Filters.fromJson(v));
      });
    }
    from = json['from'];
    to = json['to'];
    language = json['language'];
    if (json['paxes'] != null) {
      paxes = new List<Paxes>();
      json['paxes'].forEach((v) {
        paxes.add(new Paxes.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters.map((v) => v.toJson()).toList();
    }
    data['from'] = this.from;
    data['to'] = this.to;
    data['language'] = this.language;
    if (this.paxes != null) {
      data['paxes'] = this.paxes.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    data['order'] = this.order;
    return data;
  }
}

class Filters {
  List<SearchFilterItems> searchFilterItems;

  Filters({this.searchFilterItems});

  Filters.fromJson(Map<String, dynamic> json) {
    if (json['searchFilterItems'] != null) {
      searchFilterItems = new List<SearchFilterItems>();
      json['searchFilterItems'].forEach((v) {
        searchFilterItems.add(new SearchFilterItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchFilterItems != null) {
      data['searchFilterItems'] =
          this.searchFilterItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchFilterItems {
  String type;
  String latitude;
  String longitude;

  SearchFilterItems({this.type, this.latitude, this.longitude});

  SearchFilterItems.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Paxes {
  String age;

  Paxes({this.age});

  Paxes.fromJson(Map<String, dynamic> json) {
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    return data;
  }
}

class Pagination {
  int itemsPerPage;
  int page;

  Pagination({this.itemsPerPage, this.page});

  Pagination.fromJson(Map<String, dynamic> json) {
    itemsPerPage = json['itemsPerPage'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsPerPage'] = this.itemsPerPage;
    data['page'] = this.page;
    return data;
  }
}