
This is a sample code I wrote to handle formatting values coming from the database to be exposed over an API. The purpose is to show some programming techniques and best practices.

For this second example, a class hierarchy that allows formatting of values coming from a database function inside an API was created.  It provides metric values that can be displayed be either in JSON responses or be used to print them inside a CSV file export.

For instance if the database returns a value of 0.334566, this class will handle rounding the decimals and adding the % symbol for displaying in a CVS's file. Or multiplying by 100 to return the percentage (%).

A class that represents a display metric was created (https://github.com/ignacio753/code-sample-b/blob/master/models/display_metric.rb). Each metric has its own display_format (percentage, dollar, decimal), the formatter is then dynamically called based on the type of display format. This is particularly important as using a if/else or case statement to load a class based on the required formatter is avoided (https://github.com/ignacio753/code-sample-b/blob/master/models/display_metric.rb#L33-L38). If no format matches then a Default Formatter is loaded.

Inside the formatter folder, there i sa default formatter which provides a good set of initial values (https://github.com/ignacio753/code-sample-b/blob/master/models/metrics/formatters/default_value.rb).  Each child formatter only needs to adjust and override its methods accordingly.

The methods to be overriden are declared as protected (https://github.com/ignacio753/code-sample-b/blob/master/models/metrics/formatters/default_value.rb#L35-L48)

Notice for instance how the percentage formatter inherits from decimal, and decimal from default (https://github.com/ignacio753/code-sample-b/blob/master/models/metrics/formatters/percentage_value.rb).

I really like leveraging the power that object oriented programming has to offer, and this is a example of how combined with Ruby's dynamic programming it can result in some clean and elegant solutions.
