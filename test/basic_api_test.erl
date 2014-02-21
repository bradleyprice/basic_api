-module (basic_api_test).
-compile (export_all).

% etest macros
-include_lib ("etest/include/etest.hrl").
% etest_http macros
-include_lib ("etest_http/include/etest_http.hrl").

before_suite() ->
    application:start(basicapi).	

after_suite() ->
    application:stop(basicapi).

test_basic_operation() ->
    ?assert_equal(1, 1).

test_hello_world() ->
    Response = ?perform_get("http://localhost:3000/hello/world"),
    ?assert_status(200, Response),
    ?assert_body_contains("Hello", Response),
    ?assert_body("Hello World!", Response).
