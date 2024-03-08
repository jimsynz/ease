# Ease

[![Build Status](https://drone.harton.dev/api/badges/james/ease/status.svg?ref=refs/heads/main)](https://drone.harton.dev/james/ease)
[![Hex.pm](https://img.shields.io/hexpm/v/ease.svg)](https://hex.pm/packages/ease)
[![Hippocratic License HL3-FULL](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-FULL&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/full.html)

A generic implementation of standard easing functions for use in animation or
robotics.

For examples of "standard" easing algorithms (in this case used in CSS
animations) take a look at [easings.net](http://easings.net)

## Installation

Ease is [available in Hex](https://hex.pm/packages/ease), the package can be installed
by adding `ease` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ease, "~> 1.0.1"}
  ]
end
```

Documentation for the latest release can be found on
[HexDocs](https://hexdocs.pm/ease) and for the `main` branch on
[docs.harton.nz](https://docs.harton.nz/james/ease).

## Usage

You can use an easing function directly from within your own loop, provided
that you can supply the four arguments needed;

- `current_time` - the elapsed "time" in the loop, ie if your `duration` is
  ten, and you want to find the position for half way through the duration
  then you set it to `5`. Units are arbitrary (steps, ms, whatever).
- `start_value` - the initial value or position at `current_time` of zero.
- `change_in_value`- how much the `start_value` should be changed by the end
  of the animation, ie the expected final value minus the `start_value`.
- `duration` - the duration of the animation, in the same units as `current_time`.

Given a quadratic ease-in of `1..10`, over 1 unit of time, where would we be
when half-way through:

    iex> Ease.ease_in_quad(0.5, 1, 10, 1)
    3.25

Plot the `{x, y}` positions for a circular ease-in:

    iex> ys = 1..10
    ...> xs = Ease.map(ys, :ease_in_circular)
    ...> Enum.zip(xs, ys)
    [{1.0, 1}, {1.0557280900008417, 2}, {1.2250356126078779, 3},
     {1.5147186257614298, 4}, {1.9377422517014504, 5}, {2.5166852264521173, 6},
     {3.291796067500631, 7}, {4.34314575050762, 8}, {5.876894374382339, 9},
     {10.0, 10}]

## Github Mirror

This repository is mirrored [on Github](https://github.com/jimsynz/ease)
from it's primary location [on my Forgejo instance](https://harton.dev/james/ease).
Feel free to raise issues and open PRs on Github.

## License

This software is licensed under the terms of the
[HL3-FULL](https://firstdonoharm.dev), see the `LICENSE.md` file included with
this package for the terms.

This license actively proscribes this software being used by and for some
industries, countries and activities. If your usage of this software doesn't
comply with the terms of this license, then [contact me](mailto:james@harton.nz)
with the details of your use-case to organise the purchase of a license - the
cost of which may include a donation to a suitable charity or NGO.
