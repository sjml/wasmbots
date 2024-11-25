// I hate that this doesn't already exist >:(

// does not express the fullness of the file format,
//   but just what I need to make TypeScript stop yelling.

// https://doc.mapeditor.org/en/stable/reference/json-map-format/


export type TileMap = {
	type: "map",
	version: string,
	tiledversion: string,
	compressionlevel: number,
	width: number,
	height: number,
	tilewidth: number,
	tileheight: number,
	orientation: "orthogonal"|"isometric"|"staggered"|"hexagonal",
	renderorder: "right-down"|"right-up"|"left-down"|"left-up",
	infinite: boolean,
	nextobjectid: number,
	nextlayerid: number,
	properties?: TiledProperty[],
	layers: TileLayer[],
	tilesets: Tileset[],
};

export type TileLayer = {
	id: number,
	name: string,
	type: "tilelayer",
	width: number,
	height: number,
	visible: boolean,
	opacity: number,
	x: number,
	y: number,
	data: number[],
};

export type Tileset = {
	name: string,
	type: "tileset",
	version: string,
	tiledversion: string,
	image: string,
	imagewidth: number,
	imageheight: number,
	tilecount: number,
	columns: number,
	margin: number,
	spacing: number,
	tilewidth: number,
	tileheight: number,
	firstgid: number,
	tiles: Tile[],

	// my own addition 😬
	tileData?: any,
};

export type Tile = {
	id: number,
	type?: string,
	probability?: number,
	properties?: TiledProperty[],
};

export type TiledProperty = {
	name: string,
	type: "int"|"string",
	value: number|string,
};