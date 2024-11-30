./target/debug/risingwave compactor --listen-addr 0.0.0.0:6660 --advertise-addr localhost:6660 --meta-address http://localhost:5690

./target/debug/risingwave compute --listen-addr 0.0.0.0:5688 --advertise-addr localhost:5688 --meta-address http://localhost:5690

./target/debug/risingwave frontend --listen-addr 0.0.0.0:4566 --meta-addr http://localhost:5690 --advertise-addr localhost:4566

./target/debug/risingwave meta --listen-addr 0.0.0.0:5690 --advertise-addr localhost:5690 --dashboard-host 0.0.0.0:5691 --state-store hummock+s3://kafka-testing-files --data-directory iceberg_hive_local_test --backend mem
