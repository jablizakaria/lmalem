//import $ from 'jquery';
import 'select2';

// Requiring CSS! Path is relative to ./node_modules
import 'select2/dist/css/select2.css';


$(() => {
  $('#search_specialite').select2({
    allowClear: true,
    placeholder: 'De quoi avez-vous besoin ?'

  });
});


