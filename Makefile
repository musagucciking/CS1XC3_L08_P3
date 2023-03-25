CC = gcc
CFLAGS = -Wall
BUILD_DIR = build
SRC_DIR = src
TEST_DIR = test
TEST_DATA_DIR = test_data

$(BUILD_DIR)/library.o: $(SRC_DIR)/library.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/max: $(SRC_DIR)/max.c $(SRC_DIR)/library.o | $(BUILD_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/multiply: $(SRC_DIR)/multiply.c $(SRC_DIR)/library.o | $(BUILD_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/square: $(SRC_DIR)/square.c $(SRC_DIR)/library.o | $(BUILD_DIR)
	$(CC) $(CFLAGS) $^ -o $@

all: $(BUILD_DIR)/max $(BUILD_DIR)/multiply $(BUILD_DIR)/square

clean:
	rm -rf $(BUILD_DIR) $(TEST_DIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

test: all
	mkdir -p $(TEST_DIR)
	./$(BUILD_DIR)/square inches < $(TEST_DATA_DIR)/square_input.txt > $(TEST_DIR)/square_output.txt
	diff $(TEST_DATA_DIR)/square_expected.txt $(TEST_DIR)/square_output.txt
	./$(BUILD_DIR)/max 4 3  2 1 5 7 8 10 6 > $(TEST_DIR)/max_output.txt
	diff $(TEST_DATA_DIR)/max_expected.txt $(TEST_DIR)/max_output.txt
	./$(BUILD_DIR)/multiply 2 < $(TEST_DATA_DIR)/multiply_input.txt > $(TEST_DIR)/multiply_output.txt
	diff $(TEST_DATA_DIR)/multiply_expected.txt $(TEST_DIR)/multiply_output.txt
	rm -rf $(TEST_DIR)
