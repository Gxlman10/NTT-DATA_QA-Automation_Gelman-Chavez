function fn() {

  var config = {
    baseUrl: 'https://serverest.dev' // url base, todos los features la heredan
  };

  // timeouts en ms, serverest a veces tarda
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 15000);

  // para ver req/res completo cuando falla algo
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}
