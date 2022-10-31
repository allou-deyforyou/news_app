
proto:
	protoc -I=schema schema/*.proto --go_out=server/internal/storage  --dart_out=client/lib/screen/service/schema
	# protoc -I=/usr/include/google/protobuf /usr/include/google/protobuf/*.proto --go_out=server/internal/store/schema/google

ent:
	cd server/ && go generate ./...

run:
	cd server/ && PORT=3000 go run main.go