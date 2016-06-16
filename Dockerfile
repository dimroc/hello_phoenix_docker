FROM maslenkov/phoenix-framework:1.2.5

COPY . /usr/src/app
RUN node_modules/brunch/bin/brunch build --production
RUN mix deps.get
RUN mix compile
RUN mix phoenix.digest

ENV PORT 4444
EXPOSE 4444
CMD ["mix","phoenix.server"]
