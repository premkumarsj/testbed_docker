#!/usr/bin/perl
use CGI ;
$cgi = CGI::new ;
printf "Set-Cookie: This is a cookie that will split any header. The length of this cookie will be much more than any packet. The junk starts now....rGnOtHlQcRuLrVeZcPaZcHoFjQiGxHcQqPeJwRzBiVoZtUaVjAvNjLvSdDyAmCsCsWnQpNtZkHyDeBbPdWdNjYfNdGpPiIsCgHvWuOxHyYkCzLrCjUpVuXiXdZnLhHoQoJmLzLsXjEbIsTlDpAyKzGjCgYoPfEfWpTjOfDmOhPxBkKfAmDmMmXoUwEjDiPzZkKoPnCeXrDyCpFeBjSnXpErLiApTrQsCdItQkZpEcQgTvMvGeKdToWhZxYuQoMuRxOkHnBnSrTlPhIxLtBhHzQiWoCpCrJwOxIvNjJhBeSsObPbWsIdSyMqOoFtFrPtQxRdIcKlIfDwItYeLiHfJvWxMdQtUhPlGiQpMdAuIgTqZtUmDdSmBqMpVeIqMzDuHvLtYoQgUlYvEuHjAbWbTkSpOaHcCmZjHkFgYxOuInPoJzXjAvMwFeNwHuAjIzUpKzXkYmFgBuWkTuWwPiSxNfTuBtFjTzAfByPzMwIpTeZoAxKqGeNvLgPoBwXuXaByYtAkPkBiOaXpAjHgQuBbCsSdOpAlPbMpUoBmYcWoFvFfFmLvIoYmGqSwIuJzVxRsLsGjXcAcYfHfSuCcKcPqVhOdBzEyXvSiQyUnDuPbZyItUkWeMnWjWkMzLtZiOsTgSnTxJkYkIiEcUcIjReSpQfOcApKqJfXcUqZdBaOlKuQfYyOrFgGvNwZnLmEvRbZmTyRwAhKlDcQdAeUhKcFaYeNkQrFkUeYqEpOhXySaAkEdQaMcDrCbYqLqJsAgYyYfOmMnNgNnQtSgUfIxWnYwDmNoGnUfOsMeHyRuEgHwAcEuHmRfBrCeFrVmGrTuKfAtDrNjAwFaYjUhXnNzGrFmKaYqSrNeWnXbHmKhIpHhAdQxSdYyWeKgGiZaBmExZdAiPkPyByHbBxBtDzSbDcKmNjMoXtOyYoHoByOcXxEyWfUzEoDkSnYfYkWxFmVeAeUbDiEaHkAdRwFxKiJdXhKvUiSzUpFxUzYxJeZqQzUhYzFiJoNgWyDsIxRdMxAiYaFiHgYxIuFgVmOeAcMyCpQmMkPbHrJfSrPzXqWfKdLiPcOsGbQkQhWfRmGaFrHxIxYiNxNzAbJsDyKlZcVrJrWcFeElWoKgLjOaGeBiFlCkJmVkPsBaJyFrElCcZmJmXzMdDqOkDqWmFtWuLzWxXdOePsGoGpBeRpHwHxHkOfYtZwPmWnJvRzZiRgYaXbEqTnNaLuNbZlUaKlNiYwDrYdZrLyRkZvBsJoVwKiXlVrMhEbPcXtUxYvPlTgXvEyPpOmLaWiMsBaBfBrJaMdYmZpZuVwRbXhQnTbOqLcKmEnTfEdHsIhEjWfEuCvVzEmOaPcSbGcPkRjPwOzQyGxIdCoZeLuFqIuSyYkZfOoRfZhDnIuOoRwTtKsAxPhNxDhXcRyJfNaNoJqErKsIdObZaWzXnInKmUkQoIbVxBiMnBqGlKqRaSqCqRzDbOpNlBfBkGwHkHvZiNfVxWmXqEzIxBnZrCoEgUfQcE\n" ;

print "Content-type: text/html\n\n";

print $cgi->start_html(-title=>'Compression Test for Split Headers');

print "This page has text/html content. It is a split headers page" ;

print $cgi->end_html() ;
