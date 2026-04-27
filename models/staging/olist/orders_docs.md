{% docs status %}

One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| created        | Order created, not yet shipped                   |
| approved       | Order has been approved for processing           |
| processing     | Order is being processed, not yet been shipped   |
| invoice        | Order is waiting for the invoice payment         |
| shipped        | Order has been shipped, not yet been delivered   |
| unavailable    | Order is unavailable                             |
| delivered      | Order has been delivered                         |
| canceled       | Order has been canceled                          |

{% enddocs %}