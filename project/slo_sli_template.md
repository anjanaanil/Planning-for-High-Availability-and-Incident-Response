# API Service

| Category     | SLI                                                                                  | SLO                                                                                                         |
|--------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | total number of successful requests / total number of requests                       | 99%                                                                                                         |
| Latency      | buckets of requests in a histogram showing the 90th percentile over a period of time | 90% of requests below 100ms                                                                                 |
| Error Budget |1 - (error occurred/error budget) | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |  total number of successful requests over a period of time                           | 5 RPS indicates the application is functioning                                                              |