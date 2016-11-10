if Station.all.empty?
  Station.create(
    name: 'Fox31 Denver',
    url: 'http://www.kdvr.com',
    logo_path: 'http://i0.wp.com/www.mannafoodtruck.com/wp-content/uploads/2012/07/FOX-31-Denver-logo.jpg',
    city: 'Denver',
    state: 'CO',
    zipcode: '80203',
    call_letters: 'kdvr'
  )

  Station.create(
    name: '9News',
    url: 'http://www.9news.com',
    logo_path: 'http://vignette2.wikia.nocookie.net/logopedia/images/5/5e/9news.png/revision/latest/scale-to-width-down/640',
    city: 'Denver',
    state: 'CO',
    zipcode: '80203',
    call_letters: 'kusa'
  )

  Station.create(
    name: 'Denver7',
    url: 'http://www.thedenverchannel.com',
    logo_path: 'http://vignette3.wikia.nocookie.net/logopedia/images/0/02/ABC7_LosAngeles2013.png/revision/latest/scale-to-width-down/200',
    city: 'Denver',
    state: 'CO',
    zipcode: '80203',
    call_letters: 'kmgh'
  )

  Station.create(
    name: 'CBS Denver',
    url: 'http://denver.cbslocal.com',
    logo_path: 'https://upload.wikimedia.org/wikipedia/commons/0/08/Kcnc_2009.png',
    city: 'Denver',
    state: 'CO',
    zipcode: '80203',
    call_letters: 'kcnc'
  )
end
