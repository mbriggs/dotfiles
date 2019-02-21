#!/usr/bin/env bash

function pg {
  psql service=$1
}

_pg_services='message_store message_store-production nph nph-production'
complete -W "${_pg_services}" 'pg'
