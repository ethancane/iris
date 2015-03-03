// jshint nonew: false
'use strict';

describe('ApplicationView', function() {

  beforeEach(function() {
    loadFixture('news_items_controller');
    var view = new Iris.Views['layouts/application']({el: '#body'});
  });

  describe('clicking on the close icon', function() {
    it('closes the flash message feedback bar', function() {
      $('#body').append(
        '<div id="feedback_bar" class="line_height_buffer_base.' +
        'vertical_padding_small">' +
        '<span class="icon_close icon"></span>' +
        '</div>'
      );
      expect($('#feedback_bar:visible').length).toBe(1);
      $('#feedback_bar .icon_close').click();
      expect($('#feedback_bar:visible').length).toBe(0);
    });
  });
});
