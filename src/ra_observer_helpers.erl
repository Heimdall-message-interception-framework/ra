%%%-------------------------------------------------------------------
%%% @author fms
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Sep 2021 13:55
%%%-------------------------------------------------------------------
-module(ra_observer_helpers).
-author("fms").

-include("ra_observer_events.hrl").

-define(ObserverManager, om).

%% API
-export([submit_ra_server_state_variable_event/2]).

submit_ra_server_state_variable_event(StateVariable, Value) ->
  RaServerStateVariableEvent = #ra_server_state_variable_obs_event{
    state_variable=StateVariable, value=Value},
  gen_event:sync_notify(?ObserverManager,
    {process, #obs_process_event{process=self(), event_type=ra_server_state_variable,
      event_content=RaServerStateVariableEvent}}).
