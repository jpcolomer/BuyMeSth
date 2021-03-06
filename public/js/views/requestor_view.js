// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  BuyMeSth.Views.RequestorView = (function(_super) {

    __extends(RequestorView, _super);

    function RequestorView() {
      return RequestorView.__super__.constructor.apply(this, arguments);
    }

    RequestorView.prototype.initialize = function() {
      return this.subviews = [
        new BuyMeSth.Views.NewItem({
          collection: this.collection
        })
      ];
    };

    RequestorView.prototype.render = function() {
      var subview, _i, _len, _ref;
      _ref = this.subviews;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        subview = _ref[_i];
        this.$el.append(subview.render().el);
      }
      return this;
    };

    return RequestorView;

  })(Backbone.View);

}).call(this);
