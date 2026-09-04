package com.innioasis.ipp;

/**
 * The AB-loop icon's animation tick.
 *
 * <p>A class of its own rather than a lambda because {@link Deck} keeps ONE instance of it and
 * cancels it by identity ({@code Handler.removeCallbacks}) — a lambda would be a fresh object on
 * every post and nothing would ever be cancelled.
 */
public final class DeckAnim implements Runnable {

    @Override
    public void run() {
        Deck.animTick();
    }
}
