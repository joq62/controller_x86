%%%-------------------------------------------------------------------
%%% @author c50 <joq62@c50>
%%% @copyright (C) 2024, c50
%%% @doc
%%%
%%% @end
%%% Created : 24 Sep 2024 by c50 <joq62@c50>
%%%-------------------------------------------------------------------
-module(test_ctrl).

%% API
-export([start/0]).

%%%

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("log.api").
-define(Appl,ctrl).
-define(NodeName,"ctrl").

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% 
%% @end
%%--------------------------------------------------------------------
start()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    ok=test_1(),
    ok.


%%--------------------------------------------------------------------
%% @doc
%% 
%% @end
%%--------------------------------------------------------------------

test_1()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    {ok,Host}=net:gethostname(),
    ApplNode=list_to_atom(?NodeName++"@"++Host),
    pong=rpc:call(ApplNode,?Appl,ping,[],5000),
    {Year,Month,Day}=date(),
    {ok,Year,Month,Day}=rpc:call(ApplNode,?Appl,template_call,[glurk],5000),
    
    ok.


    

%%%===================================================================
%%% Internal functions
%%%===================================================================
