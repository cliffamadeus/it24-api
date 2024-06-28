<?php
header('Content-Type: application/json');
require 'config.php';

$map_id = '0001';

try {
    // Fetch map details
    $stmt = $pdo->prepare('SELECT * FROM maps WHERE map_id = ?');
    $stmt->execute([$map_id]);
    $map = $stmt->fetch();

    // Fetch map polygon vertices
    $stmt = $pdo->prepare('SELECT vertex_lat, vertex_lng FROM map_polygon_vertices WHERE map_id = ? ORDER BY vertex_id');
    $stmt->execute([$map_id]);
    $vertices = $stmt->fetchAll();

    // Fetch map pins
    $stmt = $pdo->prepare('SELECT * FROM map_pins WHERE map_id = ?');
    $stmt->execute([$map_id]);
    $pins = $stmt->fetchAll();

    // Format the data
    $map_data = [
        'map_id' => $map['map_id'],
        'map_name' => $map['map_name'],
        'map_lat' => (float)$map['map_lat'],
        'map_lng' => (float)$map['map_lng'],
        'map_polygon_vertices' => array_map(function($vertex) {
            return [(float)$vertex['vertex_lat'], (float)$vertex['vertex_lng']];
        }, $vertices),
        'map_pins' => array_map(function($pin) {
            return [
                'pin_id' => $pin['pin_id'],
                'pin_name' => $pin['pin_name'],
                'pin_lat' => (float)$pin['pin_lat'],
                'pin_lng' => (float)$pin['pin_lng'],
                'pin_created_by' => $pin['pin_created_by']
            ];
        }, $pins)
    ];

    echo json_encode($map_data);
} catch (\Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
