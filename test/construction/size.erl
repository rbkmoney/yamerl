-module(size).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/construction/" ?MODULE_STRING ".yaml").

setup() ->
    application:start(yamerl),
    yamerl_app:set_param(node_mods, [yamerl_node_size]).

simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            [
              2000, 2000000, 2000000000, 2000000000000,
              2048, 2097152, 2147483648, 2199023255552,
              "Not a size"
            ]
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, false}])
        )
      ]
    }.

detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_seq,yamerl_node_seq,"tag:yaml.org,2002:seq",
                [{line,1},{column,1}],
                [{yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,1},{column,3}],
                    2000},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,2},{column,3}],
                    2000000},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,3},{column,3}],
                    2000000000},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,4},{column,3}],
                    2000000000000},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,6},{column,3}],
                    2048},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,7},{column,3}],
                    2097152},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,8},{column,3}],
                    2147483648},
                  {yamerl_int,yamerl_node_size,"tag:yamerl,2012:size",
                    [{line,9},{column,3}],
                    2199023255552},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,11},{column,3}],
                    "Not a size"}],
                9}}
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, true}])
        )
      ]
    }.
