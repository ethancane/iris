// jshint devel: true
'use strict';

Iris.Views['public_charts-show'] = Backbone.View.extend({
  events: {
    'click .dropdown_button.hospital': '_toggleDropdownHospital',
    'click .dropdown_button.compare': '_toggleDropdownCompare',
    'click .dropdown_items.hospital li': '_selectHospital',
    'keydown input': '_preventEnterFromSubmitting',
    'click .search_box .icon_close' : '_closeSearchHospital'
  },

  initialize: function() {
    _.bindAll(this, '_autocompleteSource');

    this._searchBoxInput().autocomplete({
      source: this._autocompleteSource
    });
  },

  _searchBoxInput: function() {
    return this.$('.search_box input');
  },

  _autocompleteSource: function(request, response) {
    this._searchResults().load(this._searchEndpoint(request.term));
    response([]);
  },

  _searchResults: function() {
    return this.$('.dropdown_items.hospital ul');
  },

  _toggleDropdownHospital: function() {
    this._selectAndCompare()
    .removeClass('show_compare')
    .toggleClass('show_hospital');
  },

  _toggleDropdownCompare: function() {
    this._selectAndCompare()
    .removeClass('show_hospital')
    .toggleClass('show_compare');
  },

  _selectAndCompare: function() {
    return this.$('#select_and_compare');
  },

  _selectHospital: function(event) {
    var selectedHospital = $(event.currentTarget);
    var name = selectedHospital.find('p:first').text();

    $('.hospital_name').html(name);
    this._toggleDropdownHospital();
    this._refreshCompareDropdown(selectedHospital.data('hospital-id'));
  },

  _refreshCompareDropdown: function(hospitalId) {
    this._compareResults().load(this._compareEndpoint(hospitalId));
  },

  _compareResults: function() {
    return this.$('.dropdown_items.compare ul');
  },

  _compareEndpoint: function(hospitalId) {
    // TODO: Get this from a path helper in the Rails template
    return '/hospital_search_results/' + hospitalId;
  },

  _searchEndpoint: function(requestTerm) {
    // TODO: Get this from a path helper in the Rails template
    return '/hospital_search_results/?term=' + encodeURIComponent(requestTerm);
  },

  _preventEnterFromSubmitting: function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      return false;
    }
  },

  _closeSearchHospital: function() {
    this._searchResults().empty();
    this._searchBoxInput().val('');
    this._toggleDropdownHospital();
  }

});
