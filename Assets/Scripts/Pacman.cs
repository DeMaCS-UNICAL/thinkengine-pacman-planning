using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;

[RequireComponent(typeof(Movement))]
public class Pacman : MonoBehaviour
{
    public AnimatedSprite deathSequence;
    public SpriteRenderer spriteRenderer { get; private set; }
    public new Collider2D collider { get; private set; }
    public Movement movement { get; private set; }
    private Tilemap walls;
    private List<KeyValuePair<int, int>> wallsPosition;

    private void Awake()
    {
        this.spriteRenderer = GetComponent<SpriteRenderer>();
        this.collider = GetComponent<Collider2D>();
        this.movement = GetComponent<Movement>();
        walls = GameObject.Find("Walls").GetComponent<Tilemap>();
        wallsPosition = new List<KeyValuePair<int, int>>();
        BoundsInt bounds = walls.cellBounds;
        TileBase[] wallsTiles = walls.GetTilesBlock(bounds);
        for (int x = 0; x < bounds.size.x; x++)
        {
            for (int y = 0; y < bounds.size.y; y++)
            {
                TileBase tile = wallsTiles[x + y * bounds.size.x];
                if (tile != null)
                {
                    wallsPosition.Add(new KeyValuePair<int, int>(x, y));
                    //Debug.Log(x + " " + y + " " + tile.name);
                }
            }
        }
    }

    private void Update()
    {
        // Set the new direction based on the current input
        if (Input.GetKeyDown(KeyCode.W) || Input.GetKeyDown(KeyCode.UpArrow)) {
            this.movement.SetDirection(Vector2.up);
        }
        else if (Input.GetKeyDown(KeyCode.S) || Input.GetKeyDown(KeyCode.DownArrow)) {
            this.movement.SetDirection(Vector2.down);
        }
        else if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow)) {
            this.movement.SetDirection(Vector2.left);
        }
        else if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow)) {
            this.movement.SetDirection(Vector2.right);
        }

        // Rotate pacman to face the movement direction
        float angle = Mathf.Atan2(this.movement.direction.y, this.movement.direction.x);
        this.transform.rotation = Quaternion.AngleAxis(angle * Mathf.Rad2Deg, Vector3.forward);
    }

    public void ResetState()
    {
        this.enabled = true;
        this.spriteRenderer.enabled = true;
        this.collider.enabled = true;
        this.deathSequence.enabled = false;
        this.deathSequence.spriteRenderer.enabled = false;
        this.movement.ResetState();
        this.gameObject.SetActive(true);
    }

    public void DeathSequence()
    {
        this.enabled = false;
        this.spriteRenderer.enabled = false;
        this.collider.enabled = false;
        this.movement.enabled = false;
        this.deathSequence.enabled = true;
        this.deathSequence.spriteRenderer.enabled = true;
        this.deathSequence.Restart();
    }

}
