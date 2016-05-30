  $(document).ready(function () {
   $("#category_form").validate({
    debug: false,
    rules: {
      "category[name]": { required: true, maxlength: 50 }
      },

      messages: {
       "expense[name]": "Please enter a valid name"
      }
    });
  });