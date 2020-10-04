///<reference path="./node_modules/three.js/src/Three.d.ts"/>

let _cube: THREE.Mesh;
let _renderer: THREE.WebGLRenderer;
let _scene: THREE.Scene;
let _camera: THREE.PerspectiveCamera;
let white = new THREE.MeshBasicMaterial({ color: 0xffffff, side: THREE.DoubleSide });

function draw(points, color, baseX = 0, baseY = 0) {
    var points = points.map(
        x => new THREE.Vector3(x[0] + baseX, x[1] + baseY, 0)
    );
    var geometry = new THREE.BufferGeometry().setFromPoints(points);
    var line = new THREE.Line(geometry, color);
    _scene.add(line);
}

function drawBox(points, color, baseX = 0, baseY = 0) {
    var squareGeometry = new THREE.Geometry();
    points.map(x => squareGeometry.vertices.push(
        new THREE.Vector3(x[0], x[1])
    ))
    squareGeometry.faces.push(new THREE.Face3(0, 1, 2));
    squareGeometry.faces.push(new THREE.Face3(0, 2, 3));
    // Create a mesh and insert the geometry and the material. Translate the whole mesh
    // by 1.5 on the x axis and by 4 on the z axis and add the mesh to the scene.
    var squareMesh = new THREE.Mesh(squareGeometry, color);
    squareMesh.position.set(baseX, baseY, 0.0);
    _scene.add(squareMesh);
}

function initialize() {
    _scene = new THREE.Scene();
    _camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
    );
    _camera.lookAt(0, 0, 0);
    _camera.position.set(0, 0, 100);
    _renderer = new THREE.WebGLRenderer();
    _renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(_renderer.domElement);
}

initialize();
let leftRoof = [-40, 50];
draw([leftRoof, [-10, 60], [20, 50], leftRoof], white);
draw(
    [
        [-35, 50],
        [-35, 0],
        [15, 0],
        [15, 50],
    ],
    white
);
draw(
    [
        [-30, 0],
        [-30, 20],
        [-20, 20],
        [-20, 0],
    ],
    white
);
draw(
    [
        [0, 0],
        [0, 14],
        [14, 14],
        [14, 0],
        [0, 0]
    ],
    white,
    -6.5, 22.5
);
_renderer.render(_scene, _camera);

