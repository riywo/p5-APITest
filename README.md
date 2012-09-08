<pre>
$ perl diff.pl
+--+---------------------------------------+---------------------------------------+
| 1|bless( {                               |bless( {                               |
| 2|  'client' => bless( {                 |  'client' => bless( {                 |
| 3|    'backends' => {                    |    'backends' => {                    |
* 4|      'psgi-local' => sub { "DUMMY" }  |      'http' => sub { "DUMMY" }        *
| 5|    }                                  |    }                                  |
| 6|  }, 'Plack::Client' ),                |  }, 'Plack::Client' ),                |
* 7|  'server' => 'psgi-local://app.psgi'  |  'server' => 'http://localhost:5000'  *
| 8|}, 'APITest' )                         |}, 'APITest' )                         |
+--+---------------------------------------+---------------------------------------+
+---+----------------------------------------------------------+---+----------------------------------------------------------+
|  3|    '{"aaa":1}'                                           |  3|    '{"aaa":1}'                                           |
|  4|  ],                                                      |  4|  ],                                                      |
|  5|  'headers' => bless( {                                   |  5|  'headers' => bless( {                                   |
*  6|    'content-length' => 9,                                *  6|    'content-length' => '9',                              *
|  7|    'content-type' => 'application/json; charset=utf-8',  |  7|    'content-type' => 'application/json; charset=utf-8',  |
|   |                                                          *  8|    'date' => 'Sun, 12 Aug 2012 06:07:02 GMT',            *
|   |                                                          *  9|    'server' => 'HTTP::Server::PSGI',                     *
|  8|    'x-content-type-options' => 'nosniff',                | 10|    'x-content-type-options' => 'nosniff',                |
|  9|    'x-frame-options' => 'DENY'                           | 11|    'x-frame-options' => 'DENY'                           |
| 10|  }, 'HTTP::Headers' ),                                   | 12|  }, 'HTTP::Headers' ),                                   |
* 11|  'status' => 200                                         * 13|  'status' => '200'                                       *
| 12|}, 'Plack::Response' )                                    | 14|}, 'Plack::Response' )                                    |
+---+----------------------------------------------------------+---+----------------------------------------------------------+
</pre>

