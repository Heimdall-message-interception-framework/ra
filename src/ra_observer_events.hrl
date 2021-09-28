%%%-------------------------------------------------------------------
%%% @author fms
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Sep 2021 09:56
%%%-------------------------------------------------------------------
-author("fms").

-record(ra_log_obs_event, {
  idx :: any(),
  term :: any(),
  trunc :: boolean(),
  data :: any()
}).

%% copy-pasted due to dependency issue
-record(obs_process_event, {
  process :: pid() | atom(),
  event_type :: any(),
  event_content :: any()
%%  the idea is to pattern-match on event_type (e.g. ra_log) and then have the same shape in event_content
%%  for raft currently:
%%    ra_log - {ra_log, {{pid, PId}, {idx, Idx}, {term, Term}, {trunc, Trunc}, {data, Data0}}}
%%    ra_machine // need to distinguish to pattern-match
%%               - {ra_machine, {{pid, self()}, {state_update, State, NewState}}}
%%                 {ra_machine, {{pid, self()}, {reply, {{index, Index}, {term, Term}}}}}
%%                 {ra_machine, {{pid, self()}, {side_effects, SideEffects}}}
%%    gen_mi_statem - a lot on different state and data etc //currently not used anymore
}).
