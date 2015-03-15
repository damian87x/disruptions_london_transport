every 1.hour do
  runner "CacheHandler.perform_async"
end