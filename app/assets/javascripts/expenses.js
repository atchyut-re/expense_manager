  //jQuery('.datetimepicker').datetimepicker({format:'d-M-Y', timepicker:false });

  $(document).ready(function () {
   $("#expense_form").validate({
    debug: false,
    rules: {
      "expense[amount]": { required: true, maxlength: 10, number: true, min: 0, max: 10000000},
      "expense[date]": { required: true },
      "expense[category]": { required: true },
      "expense[description]": { required: true, maxlength: 500 }
      },

      messages: {
        "expense[amount]": "Please Enter only number value above 0",
        "expense[date]": "Please select a valid date",
        "expense[category]": "Please select a particular category",
       "expense[description]": "Please enter minimum description"
      }
    });
  });