: ${SHOW_SETTINGS:=false}

#############################################################################
# Global settings
: ${COMPOSE_PROJECT_NAME:="kg"}
: ${SPATIAL_SEARCH_HOME:?"SPATIAL_SEARCH_HOME IS UNSET, exiting..."}

#############################################################################
# Solr Service settings
: ${KG_SPATIAL_SEARCH_IMAGE:="mercator"}
: ${KG_SPATIAL_SEARCH_VERSION:=""}

: ${KG_SPATIAL_SEARCH_HOST:="localhost"}
: ${KG_SPATIAL_SEARCH_PORT:="8888"}
: ${KG_SPATIAL_SEARCH_BASE:="spatial-search"}

: ${KG_SPATIAL_SEARCH_DATA:="${SPATIAL_SEARCH_HOME}/data"}
: ${KG_SPATIAL_SEARCH_USER_ID:="8983"}
: ${KG_SPATIAL_SEARCH_GROUP_ID:="8983"}

: ${KG_SPATIAL_SEARCH_SERVICE_NAME:="${COMPOSE_PROJECT_NAME}_spatial-search_1"}
: ${KG_SPATIAL_SEARCH_LOG_LVL:="warn,actix_web=info,mercator_service=info"}
: ${KG_SPATIAL_SEARCH_ALLOWED_ORIGINS:="http://localhost:3200"}
: ${KG_SPATIAL_SEARCH_MAX_MEM:=$((8 * 1073741824))} # Max X x 1GB
