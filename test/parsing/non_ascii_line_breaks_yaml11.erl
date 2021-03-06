-module('non_ascii_line_breaks_yaml11').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [{io_blocksize, 1}],
        <<>>,
        62,
        true,
        [],
        0,
        58,
        7,
        1,
        false,
        5,
        20,
        utf8,
        false,
        undefined,
        _,
        _,
        [],
        {bcoll,root,0,-1,1,1,-1,1,1},
        false,
        false,
        false,
        [{impl_key,false,false,undefined,undefined,1,1}],
        false,
        false,
        _,
        [],
        0,
        7,
        6,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,5,20},
          {yamerl_doc_end,5,20},
          {yamerl_scalar,3,1,
            {yamerl_tag,3,1,{non_specific,"?"}},
            flow,plain,
            "Next line Line separator Paragraph separator"},
          {yamerl_doc_start,3,1,{1,1},_},
          {yamerl_yaml_directive,1,1,{1,1}},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME, [{io_blocksize, 1}])
    ).
