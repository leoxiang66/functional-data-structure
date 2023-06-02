# Functional Data Structures Using PureScript

This project is about implementing Functional Data Structures using the PureScript programming language. PureScript is a strongly-typed, purely functional programming language that compiles to JavaScript.

## Project Structure

The project is organized as follows:

- `src`: This directory contains the PureScript source files.
- `test`: This directory contains the tests for the project.

## Getting Started

Here are the steps to get started with this project:

### Prerequisites

You need to have `npm` (Node Package Manager), `spago` (PureScript package manager and build tool) and `purs` (The PureScript compiler) installed on your machine.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/<your-username>/purescript-fds.git
    ```

2. Change into the project directory:

    ```bash
    cd purescript-fds
    ```

3. Install the dependencies:

    ```bash
    spago install
    ```

4. Build the project:

    ```bash
    spago build
    ```

5. To run the `Main.purs`:

    ```bash
    spago run
    ```

## Usage

Once you have built the project, you can import the data structures and use them in your PureScript programs.

Here's an example:

```purescript
module Main where

import Prelude
import Algos.Search (linearSearch)
import Data.List (List, singleton)
import Effect.Console (logShow)

main = do
  let xs = singleton 1
  logShow $ linearSearch 1 xs
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for details.
