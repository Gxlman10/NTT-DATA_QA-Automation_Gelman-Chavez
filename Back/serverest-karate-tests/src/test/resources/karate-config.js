function fn() {

  var config = {
    baseUrl: 'https://serverest.dev' 
  };


  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 15000);

  
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}
