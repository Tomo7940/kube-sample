FROM golang:alpine AS build-stage

COPY ./main.go ./

RUN go build -o /go-app ./main.go


FROM alpine:3.6

EXPOSE 8080

COPY --from=build-stage /go-app .

USER nobody

ENTRYPOINT ["./go-app"]
