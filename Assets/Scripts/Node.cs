using System;
using System.Collections.Generic;
using UnityEngine;

public class Node : MonoBehaviour
{
    public LayerMask obstacleLayer;
    public List<Vector2> availableDirections { get; private set; }
    private List<KeyValuePair<int, int>> intDirections;

    private void Start()
    {
        this.availableDirections = new List<Vector2>();
        intDirections = new List<KeyValuePair<int, int>>();
        // We determine if the direction is available by box casting to see if
        // we hit a wall. The direction is added to list if available.
        CheckAvailableDirection(Vector2.up);
        CheckAvailableDirection(Vector2.down);
        CheckAvailableDirection(Vector2.left);
        CheckAvailableDirection(Vector2.right);
    }

    private void CheckAvailableDirection(Vector2 direction)
    {
        RaycastHit2D hit = Physics2D.BoxCast(this.transform.position, Vector2.one * 0.5f, 0.0f, direction, 1.0f, this.obstacleLayer);

        // If no collider is hit then there is no obstacle in that direction
        if (hit.collider == null) {
            this.availableDirections.Add(direction);
            intDirections.Add(new KeyValuePair<int, int>((int)Math.Truncate(direction.x), (int)Math.Truncate(direction.y)));
        }
    }

}
