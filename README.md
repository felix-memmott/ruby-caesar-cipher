# Ruby Caesar Cipher

A robust and efficient implementation of the Caesar cipher in Ruby with comprehensive test coverage.

## Features

- **Efficient ASCII arithmetic** - Uses mathematical character shifting instead of hash lookups
- **Case preservation** - Maintains original capitalization in encoded text
- **Wraparound support** - Handles alphabet boundaries (z→a, Z→A)
- **Negative shifts** - Supports backward shifting for decoding
- **Input validation** - Robust error handling for invalid inputs
- **Non-alphabetic preservation** - Keeps spaces, punctuation, and numbers unchanged
- **Comprehensive tests** - 30 RSpec tests covering all functionality

## Installation

1. Clone the repository:
```bash
git clone https://github.com/felix-memmott/ruby-caesar-cipher.git
cd ruby-caesar-cipher
```

2. Install dependencies:
```bash
bundle install
```

## Usage

```ruby
require_relative 'ruby-caesar-cipher'

# Basic encoding
caesar_cipher("hello", 3)          # => "khoor"
caesar_cipher("Hello World!", 13)  # => "Uryyb Jbeyq!"

# Decoding (use negative shift)
caesar_cipher("khoor", -3)         # => "hello"

# Case preservation
caesar_cipher("HeLLo", 1)          # => "IfMMp"

# Large shifts (automatically wraps)
caesar_cipher("abc", 29)           # => "def" (same as shift of 3)
```

## Running Tests

Run the full test suite:
```bash
rspec
```

The test suite includes:
- Basic functionality tests
- Case preservation tests
- Various shift values (positive, negative, large)
- Edge cases (empty strings, single characters)
- Input validation tests
- Helper method tests

## How It Works

The Caesar cipher shifts each letter in the alphabet by a fixed number of positions:

1. **Character conversion**: Uses ASCII values for efficient shifting
2. **Modulo arithmetic**: Handles wraparound automatically (`% 26`)
3. **Case detection**: Preserves uppercase/lowercase through base ASCII values
4. **Non-alphabetic handling**: Passes through spaces, punctuation, and numbers unchanged

### Example Shift (Caesar cipher with shift of 3):
```
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
D E F G H I J K L M N O P Q R S T U V W X Y Z A B C
```

## Code Structure

- `caesar_cipher(text, shift_value)` - Main function with input validation
- `shift_letter(letter, shift_value)` - Helper method for individual character shifting
- Functional programming approach using `map` for clean, readable code

## AI Usage

I used Anthropic's Claude Code to aid me in writing tests and action various bug fixes. However, the large majority of the code was implemented by myself.


## Historical Note

The Caesar cipher is named after Julius Caesar, who used it in his private correspondence with a shift of 3. This implementation supports any shift value and both encoding and decoding operations.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass with `rspec`
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).
