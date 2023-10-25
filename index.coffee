command: 'cat ~/inspirationalQuotes.json' #read the file

refreshFrequency: 5000  # Refresh every 5 seconds

style: """
  position: absolute;
  top: 2.5rem;
  right: 2.5rem;
  color: #333;
  background-color: rgba(240, 240, 240, 0.3);
  font-family: Helvetica Neue, sans-serif
  border: 1px solid #ddd;
  border-radius: 10px; /* Rounded corners */

  .output
    padding: 5px 10px
    width: 300px
    font-size: 20px
    font-weight: bold
    font-smoothing: antialiased

  .author, .example, .example-meaning
    text-transform: capitalize
    font-size: 14px
  .author
    text-align: right
"""

render: (output) -> """
  <div class="output">
    <div class="quote"></div>
    <div class="author"></div>
  </div>
"""

update: (output, domEl) ->
  try
    quotes = JSON.parse(output)

    if Array.isArray(quotes) && quotes.length > 0
      randomIndex = Math.floor(Math.random() * quotes.length)
      quote = quotes[randomIndex]

      # Define constants, and extract the HTML elements.
      dom = $(domEl)

      # Inject the random quote into the DOM.
      dom.find('.quote').text(quote.text)
      dom.find('.author').text(quote.author)
    else
      console.error("No quotes found in the JSON file.")
  catch error
    console.error("Error parsing JSON:", error)
