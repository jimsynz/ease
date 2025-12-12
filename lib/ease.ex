defmodule Ease do
  import :math, only: [pow: 2, cos: 1, pi: 0, sin: 1, sqrt: 1]

  @moduledoc """
  Provides a number of popular easing functions.

  Useful if you're doing animation or some sort of motion.

  See [easings.net](http://easings.net) for nice graphs of each function.
  """

  @type easing_function ::
          :linear
          | :ease_in_quad
          | :ease_out_quad
          | :ease_in_out_quad
          | :ease_in_cubic
          | :ease_out_cubic
          | :ease_in_out_cubic
          | :ease_in_quartic
          | :ease_out_quartic
          | :ease_in_out_quartic
          | :ease_in_quintic
          | :ease_out_quintic
          | :ease_in_out_quintic
          | :ease_in_sine
          | :ease_out_sine
          | :ease_in_out_sine
          | :ease_in_expo
          | :ease_out_expo
          | :ease_in_out_expo
          | :ease_in_circular
          | :ease_out_circular
          | :ease_in_out_circular

  @doc """
  No easing.

  Constant velocity with no acceleration.

  ## Examples

      iex> Ease.map(1..10, :linear)
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
  """
  @spec linear(number, number, number, number) :: number
  def linear(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    change_in_value * current_time / duration + start_value
  end

  @doc """
  Quadratic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quad)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.111, 1.444, 2.0, 2.778, 3.778, 5.0, 6.444, 8.111, 10.0]
  """
  @spec ease_in_quad(number, number, number, number) :: number
  def ease_in_quad(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 2) + start_value
  end

  @doc """
  Quadratic ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quad)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 2.889, 4.556, 6.0, 7.222, 8.222, 9.0, 9.556, 9.889, 10.0]
  """
  @spec ease_out_quad(number, number, number, number) :: number
  def ease_out_quad(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    -change_in_value * current_time * (current_time - 2) + start_value
  end

  @doc """
  Quadratic ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quad)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.222, 1.889, 3.0, 4.556, 6.444, 8.0, 9.111, 9.778, 10.0]
  """
  @spec ease_in_out_quad(number, number, number, number) :: number
  def ease_in_out_quad(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      change_in_value / 2 * pow(current_time, 2) + start_value
    else
      current_time = current_time - 1
      -change_in_value / 2 * (current_time * (current_time - 2) - 1) + start_value
    end
  end

  @doc """
  Cubic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_cubic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.012, 1.099, 1.333, 1.79, 2.543, 3.667, 5.235, 7.321, 10.0]
  """
  @spec ease_in_cubic(number, number, number, number) :: number
  def ease_in_cubic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 3) + start_value
  end

  @doc """
  Cubic ease-out.

  Deceleration to zero velocity.
  ## Examples

      iex> Ease.map(1..10, :ease_out_cubic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 3.679, 5.765, 7.333, 8.457, 9.21, 9.667, 9.901, 9.988, 10.0]
  """
  @spec ease_out_cubic(number, number, number, number) :: number
  def ease_out_cubic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration - 1
    change_in_value * (pow(current_time, 3) + 1) + start_value
  end

  @doc """
  Cubic ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_cubic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.049, 1.395, 2.333, 4.16, 6.84, 8.667, 9.605, 9.951, 10.0]
  """
  @spec ease_in_out_cubic(number, number, number, number) :: number
  def ease_in_out_cubic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      change_in_value / 2 * pow(current_time, 3) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (pow(current_time, 3) + 2) + start_value
    end
  end

  @doc """
  Quartic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quartic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.001, 1.022, 1.111, 1.351, 1.857, 2.778, 4.294, 6.619, 10.0]
  """
  @spec ease_in_quartic(number, number, number, number) :: number
  def ease_in_quartic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 4) + start_value
  end

  @doc """
  Quartic ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quartic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 4.381, 6.706, 8.222, 9.143, 9.649, 9.889, 9.978, 9.999, 10.0]
  """
  @spec ease_out_quartic(number, number, number, number) :: number
  def ease_out_quartic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration - 1
    -change_in_value * (pow(current_time, 4) - 1) + start_value
  end

  @doc """
  Quartic ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quartic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.011, 1.176, 1.889, 3.809, 7.191, 9.111, 9.824, 9.989, 10.0]
  """
  @spec ease_in_out_quartic(number, number, number, number) :: number
  def ease_in_out_quartic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      change_in_value / 2 * pow(current_time, 4) + start_value
    else
      current_time = current_time - 2
      -change_in_value / 2 * (pow(current_time, 4) - 2) + start_value
    end
  end

  @doc """
  Quintic ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_quintic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.0, 1.005, 1.037, 1.156, 1.476, 2.185, 3.562, 5.994, 10.0]
  """
  @spec ease_in_quintic(number, number, number, number) :: number
  def ease_in_quintic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    change_in_value * pow(current_time, 5) + start_value
  end

  @doc """
  Quintic ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_quintic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 5.006, 7.438, 8.815, 9.524, 9.844, 9.963, 9.995, 10.0, 10.0]
  """
  @spec ease_out_quintic(number, number, number, number) :: number
  def ease_out_quintic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration - 1
    change_in_value * (pow(current_time, 5) + 1) + start_value
  end

  @doc """
  Quintic ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_quintic)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.002, 1.078, 1.593, 3.497, 7.503, 9.407, 9.922, 9.998, 10.0]
  """
  @spec ease_in_out_quintic(number, number, number, number) :: number
  def ease_in_out_quintic(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      change_in_value / 2 * pow(current_time, 5) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (pow(current_time, 5) + 2) + start_value
    end
  end

  @doc """
  Sinusoidal ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_sine)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.137, 1.543, 2.206, 3.106, 4.215, 5.5, 6.922, 8.437, 10.0]
  """
  @spec ease_in_sine(number, number, number, number) :: number
  def ease_in_sine(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    -change_in_value * cos(current_time / duration * pi() / 2) + change_in_value + start_value
  end

  @doc """
  Sinusoidal ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_sine)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 2.563, 4.078, 5.5, 6.785, 7.894, 8.794, 9.457, 9.863, 10.0]
  """
  @spec ease_out_sine(number, number, number, number) :: number
  def ease_out_sine(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    change_in_value * sin(current_time / duration * pi() / 2) + start_value
  end

  @doc """
  Sinusoidal ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_sine)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.271, 2.053, 3.25, 4.719, 6.281, 7.75, 8.947, 9.729, 10.0]
  """
  @spec ease_in_out_sine(number, number, number, number) :: number
  def ease_in_out_sine(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    -change_in_value / 2 * (cos(pi() * current_time / duration) - 1) + start_value
  end

  @doc """
  Exponential ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_expo)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.009, 1.019, 1.041, 1.089, 1.191, 1.413, 1.893, 2.929, 5.166, 10.0]
  """
  @spec ease_in_expo(number, number, number, number) :: number
  def ease_in_expo(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    change_in_value * pow(2, 10 * (current_time / duration - 1)) + start_value
  end

  @doc """
  Exponential ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_expo)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 5.834, 8.071, 9.107, 9.587, 9.809, 9.911, 9.959, 9.981, 9.991]
  """
  @spec ease_out_expo(number, number, number, number) :: number
  def ease_out_expo(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    change_in_value * (0 - pow(2, -10 * current_time / duration) + 1) + start_value
  end

  @doc """
  Exponential ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_expo)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.004, 1.021, 1.096, 1.446, 3.083, 7.917, 9.554, 9.904, 9.979, 9.996]
  """
  @spec ease_in_out_expo(number, number, number, number) :: number
  def ease_in_out_expo(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      change_in_value / 2 * pow(2, 10 * (current_time - 1)) + start_value
    else
      current_time = current_time - 1
      change_in_value / 2 * (0 - pow(2, -10 * current_time) + 2) + start_value
    end
  end

  @doc """
  Circular ease-in.

  Acceleration from zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_circular)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.056, 1.225, 1.515, 1.938, 2.517, 3.292, 4.343, 5.877, 10.0]
  """
  @spec ease_in_circular(number, number, number, number) :: number
  def ease_in_circular(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration
    -change_in_value * (sqrt(1 - pow(current_time, 2)) - 1) + start_value
  end

  @doc """
  Circular ease-out.

  Deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_out_circular)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 5.123, 6.657, 7.708, 8.483, 9.062, 9.485, 9.775, 9.944, 10.0]
  """
  @spec ease_out_circular(number, number, number, number) :: number
  def ease_out_circular(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / duration - 1
    change_in_value * sqrt(1 - pow(current_time, 2)) + start_value
  end

  @doc """
  Circular ease-in-out.

  Acceleration from zero velocity to half-way, then deceleration to zero velocity.

  ## Examples

      iex> Ease.map(1..10, :ease_in_out_circular)
      ...> |> Enum.map(&Float.round(&1, 3))
      [1.0, 1.113, 1.469, 2.146, 3.438, 7.562, 8.854, 9.531, 9.887, 10.0]
  """
  @spec ease_in_out_circular(number, number, number, number) :: number
  def ease_in_out_circular(current_time, start_value, change_in_value, duration)
      when is_number(current_time) and is_number(start_value) and is_number(change_in_value) and
             is_number(duration) do
    current_time = current_time / (duration / 2)

    if current_time < 1 do
      -change_in_value / 2 * (sqrt(1 - pow(current_time, 2)) - 1) + start_value
    else
      current_time = current_time - 2
      change_in_value / 2 * (sqrt(1 - pow(current_time, 2)) + 1) + start_value
    end
  end

  @doc """
  Map an enumerable into it's eased version.

  This is a pretty useless function, I've implemented it mainly for
  documentation purposes.

  ## Examples

      iex> Ease.map(1..10, :linear)
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
  """
  @spec map(Enumerable.t(), easing_function) :: Enumerable.t()
  def map(enum, fun) do
    start_value = Enum.at(enum, 0)
    last_value = Enum.at(enum, -1)
    change_in_value = last_value - start_value
    duration = change_in_value

    Enum.map(enum, &apply(Ease, fun, [&1 - start_value, start_value, change_in_value, duration]))
  end
end
