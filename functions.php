<?php
/**
 * Astra Child Theme - G7 Project
 *
 * @package AstraChild
 */

// Ngăn truy cập trực tiếp vào file.
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

/**
 * Load stylesheet cua Child Theme.
 */
function g7_child_enqueue_styles() {

    wp_enqueue_style(
        'astra-child-style',
        get_stylesheet_uri(),
        array( 'astra-theme-css' ),
        wp_get_theme()->get( 'Version' )
    );

}
add_action( 'wp_enqueue_scripts', 'g7_child_enqueue_styles', 15 );


/**
 * G7 Notice Shortcode.
 *
 * Shortcode:
 * [g7_notice]
 * [g7_notice type="success" title="Thanh cong" message="Thao tac thanh cong!"]
 */
function g7_notice_shortcode( $atts ) {

    // Khai báo giá trị mặc định.
    $atts = shortcode_atts(
        array(
            'type'    => 'info',
            'title'   => 'Thong bao',
            'message' => 'Day la thong bao tu he thong G7.',
        ),
        $atts,
        'g7_notice'
    );

    // Làm sạch dữ liệu đầu vào.
    $type = sanitize_key( $atts['type'] );

    $title = sanitize_text_field( $atts['title'] );

    $message = sanitize_text_field( $atts['message'] );

    // Chỉ cho phép các loại thông báo hợp lệ.
    $allowed_types = array(
        'info',
        'success',
        'warning',
        'danger',
    );

    // Nếu loại thông báo không hợp lệ, sử dụng info.
    if ( ! in_array( $type, $allowed_types, true ) ) {
        $type = 'info';
    }

    // Xác định thuộc tính trợ năng.
    $role = in_array(
        $type,
        array( 'warning', 'danger' ),
        true
    ) ? 'alert' : 'status';

    $live = ( 'alert' === $role ) ? 'assertive' : 'polite';

    // Xuất HTML an toàn.
    $output = sprintf(
        '<div class="g7-notice g7-notice-%1$s" role="%2$s" aria-live="%3$s">
            <strong class="g7-notice-title">%4$s</strong>
            <p class="g7-notice-message">%5$s</p>
        </div>',
        esc_attr( $type ),
        esc_attr( $role ),
        esc_attr( $live ),
        esc_html( $title ),
        esc_html( $message )
    );

    return $output;
}

// Đăng ký shortcode.
add_shortcode( 'g7_notice', 'g7_notice_shortcode' );