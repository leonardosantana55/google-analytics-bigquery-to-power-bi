SELECT
  PARSE_DATE('%Y%m%d', event_date) AS Date,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') AS page_title,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS ga_session_id,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number') AS ga_session_number,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'engaged_session_event') AS engaged_session_event,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'page_referrer') AS page_referrer,
  event_name,
  geo.country,
  geo.region,
  geo.city,
  traffic_source.name as trafic_name,
  traffic_source.medium,
  traffic_source.source,
  user_pseudo_id,
  TIMESTAMP_MICROS(event_timestamp) as event_timestamp,
  TIMESTAMP_MICROS(user_first_touch_timestamp) as user_first_touch_timestamp,

FROM `analytics-4-site-engie.analytics_336923608.events_*`

WHERE
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') = 'page1' OR
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') = 'page2' OR
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') = 'page3' OR
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') = 'page4' OR
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') = 'page5'
  AND
  geo.country = 'Brazil'