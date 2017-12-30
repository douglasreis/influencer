import { Component } from '@angular/core';
import { fadeInOut } from '../../services/animations';

@Component({
    selector: 'youtube',
    templateUrl: './youtube.component.html',
    styleUrls: ['./youtube.component.css'],
    animations: [fadeInOut]
})
export class YoutubeComponent {
}
