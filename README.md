# recruit-proxy

A simple RPC implementation exposing HTTP service.

## use-cases
1. Fetching all clients
```bash
❯ curl http://localhost:9292/clients.json
{"clients":["google","facebook","yahoo","twitter"]}
```
2. Fetching all invoices
```bash
❯ curl http://localhost:9292/invoices.json
{"invoices":[{"total":"200000000 USD","services":"Providing users data to the fbi","customer":"Federal Bureau of Investigation"},{"total":"4000 USD","services":"Selling out users emails to ad companies","customer":"Big Bad Corporations"},{"total":"899229199 USD","services":"Selling out signed users photos","customer":"NSA"},{"total":"9123 USD","services":"","customer":"Big Bad Corporation"},{"total":"121223 USD","services":"Selling out the few emails they got","customer":"Big Bad Corporations"},{"total":"12 USD","services":"Telling everybody its hard to add edit button","customer":"Who cares"}]}
```
3. Fetching filtered invoices
```bash
❯ curl http://localhost:9292/invoices.json?client_id=facebook
{"invoices":[{"total":"899229199 USD","services":"Selling out signed users photos","customer":"NSA"},{"total":"9123 USD","services":"","customer":"Big Bad Corporation"}]}
```
4. Health-check
```bash
❯ curl http://localhost:9292/ping.json
{"message":"pong"}
```
The terminating `.json` in all examples is optional.
