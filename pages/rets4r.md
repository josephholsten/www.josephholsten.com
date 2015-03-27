While I was at a [small real estate startup][], we processesed real
estate data for regions as large as the Dallas metro area. To keep our
management overhead down, we used heroku for our web app. But processing
the data had to happen on a windows server to run the [vendor's RETS
client][]. Because of this query changes ended up coupled accross
services, and when errors occured in the API client we had few options
to resolve the issue. Worse, our daily sync call could take 4 hours to
process and update our local data.

We investigated the reference client [resync][], which was binding to
libRETS. Unfortunately, this library had a habit of segfaulting due to
non-threadsafe code, and couldn't be run on heroku due to the libRETS
dependency.

So we investigated pure ruby options and discovered a number of forks of
rets4r, but the maintainer was neither merging the patches nor releasing
new gems. So we merged all the forked versions into a single repo and
contacted the authors to encourage them to continue working together.

This allowed us to move some processing to heroku workers, but we still
had a huge sync that refused to complete without crashing the instance.
We attempted to reduce the size of the query, but discovered that the
server did not implement either cursors or offsets. So we investigated
where the memory issue was, and discovered that the library was using a
DOM XML API and chewing through memory like water.

So we extracted the document API and created another parser to use SAX.
We still allowed DOM to be used because interactive and prototype work
was still much easier with it. This also allowed us to use a common test
suite to verify behaviour was the same.

Finally we shipped, and kept both data collectors running for about a
week. This allowed us to verify that the data was actually identical *in
production*.

Amazingly, it was identical on the first production release. More
amazing, it was over 10x faster than the commercial client.

  [small real estate startup]: http://www.mobicentric.com/
  [vendor's RETS client]: http://www.retsconnector.com/
  [resync]: https://code.google.com/p/crt-resync/
