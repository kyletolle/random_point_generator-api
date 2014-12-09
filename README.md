# random_point_generator-api

Provides an API for the [random_point_generator](https://github.com/kyletolle/random_point_generator) functionality.

## Development

### Install

```
git clone https://github.com/kyletolle/random_point_generator-api.git
cd random_point_generator-api
bundle install
```

### Run Server

```
bundle exec foreman start
```

### Usage

#### Without Bounding Box

##### URL

```
curl http://localhost:3000/random_point
```

##### Response
```
[-10.957047215963982, 57.354675470320984]
```

#### With Bounding Box

Pass in a query string parameter for one or both of `sw_point` and `ne_point`.
The point is a `{lat},{lng}` pair, like `1,1`, but the `,` must be HTML entity encoded to `%2C`. So the value actually used in the URL would be `1%2C1`. Not exactly the most readable, but it's what works for now.

##### URL

```
http://localhost:3000/random_point?sw_point=1%2C1&ne_point=2%2C2
```

##### Response

```
[1.1879541982775819, 1.560359306976526]
```

### Specs

The default Rake task is to run the specs.

```
rake
```

## License

MIT


