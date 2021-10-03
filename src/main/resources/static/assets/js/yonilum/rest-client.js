const RestClient = (function ($) {
  return {
    GET: function (url, data, headers) {
      if (headers === null) {
        console.warn("header is null");
      }
      const param = {
        type: 'GET',
        cache: false,
        headers: {'Content-type': 'application/json'},
        url: url,
        async: true,
      };
      if (data != null) {
        param.data = JSON.stringify(data);
      }
      return $.ajax(param)
    },
    POST: function (url, data, ext) {
      const param = {
        type: 'POST',
        cache: false,
        url: url,
        data: (typeof data !== 'string'?JSON.stringify(data):data),
        async: true,
      };
      if (typeof ext !== 'undefined' && ext !== null) {
        for (let key of Object.keys(ext)) {
          param[key] = ext[key];
        }
      } else {
        param.headers = {'Content-type': 'application/json'};
      }
      return $.ajax(param);
    },
    SYNC_GET: function (url, data, headers) {
      if (headers === null) {
        console.log("header is null");
        headers = {'Content-type': 'application/json'};
      }
      const param = {
        type: 'GET',
        cache: false,
        headers: headers,
        url: url,
        async: false,
      };
      if (data != null) {
        param.data = JSON.stringify(data);
      }
      return $.ajax(param)
    },
    SYNC_POST: function (url, data, ext) {
      const param = {
        type: 'POST',
        cache: false,
        url: url,
        data: (typeof data !== 'string'?JSON.stringify(data):data),
        async: false,
      };
      if (typeof ext !== 'undefined' && ext !== null) {
        for (let key of Object.keys(ext)) {
          param[key] = ext[key];
        }
      } else {
        param.headers = {'Content-type': 'application/json'};
      }
      return $.ajax(param);
    },
    PUT: function (url, data) {
      const param = {
        type: 'PUT',
        cache: false,
        headers: {'Content-type': 'application/json'},
        url: url,
        data: (typeof data !== 'string'?JSON.stringify(data):data),
        async: true,
      };
      return $.ajax(param);
    },
    DELETE: function (url, data) {
      const param = {
        type: 'DELETE',
        cache: false,
        headers: {'Content-type': 'application/json'},
        url: url,
        data: (typeof data !== 'string'?JSON.stringify(data):data),
        async: true,
      };
      return $.ajax(param);
    },

  };

})(jQuery);