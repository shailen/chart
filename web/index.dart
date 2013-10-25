import 'dart:html';
import 'dart:js';

void visualize() {
  JsObject google = context['google'];
  var data = google['visualization'].callMethod('arrayToDataTable',
      [new JsObject.jsify([
                          ['Year', 'Sales', 'Expenses'],
                          ['2004',  1000,    400],
                          ['2005',  1170,    460],
                          ['2006',  660,     1120],
                          ['2007',  1030,    540]
                          ])]);

  var options = new JsObject.jsify({'title': 'Company Performance'});

  var chart = new JsObject(google['visualization']['LineChart'],
      [querySelector('#chart_div')]);
  chart.callMethod('draw', [data, options]);
}


void main() {
  JsObject google = context['google'];
  google.callMethod('load', ['visualization', '1',
                             new JsObject.jsify({
                               'packages': ['corechart'],
                               'callback': visualize

                             })]);

  // I cannot set the callback this way.
  // google.callMethod('setOnLoadCallback', [visualize]);
}
